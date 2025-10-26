# Schema Evolution

:::danger Important
Think of schema changes as product release, not just technical updates.
:::

## Add New Column

- Backward- and forward-compatible
- New field registered in metadata with default value (usually null)
- Old readers simply ignore the extra column

### Best Practices

- **Use clear, descriptive names** Ensure the column name conveys its purpose and unit (e.g., order_status_code rather than status).
- **Define sensible defaults** Set a default value or mark NOT NULL with a default to prevent unintended NULLs in new and existing rows.
- **Audit downstream dependencies** Identify and update ETL jobs, views, BI reports, and API consumers before rolling out the change.
- **Communicate schema changes** Announce additions in your data catalog, schema registry, or team channels to keep everyone aligned.
- **Keep changes additive** Never repurpose or drop existing columns in the same change—additive evolution minimizes breakages.

### Exmaple

1. Add a New Column with Comment

```SQL
ALTER TABLE spark_catalog.default.orders
  ADD COLUMN new_column STRING
    COMMENT 'Detailed description of new_column’s purpose';
```

2. Define a Default Value

```SQL
ALTER TABLE spark_catalog.default.orders
  ALTER COLUMN new_column
    SET DEFAULT 'default_value';
```

## Drop / Rename Column

Thaey are the common actions, you need to be caution

### Drop Colum

- Allowed only if no downstream jobs or queries depend on it
- Iceberg tracks dropped columns in history—reads of old snapshots still work

:::tip
**Safest practice:** deprecate first, then drop at next major version
:::

### Rename Column

- Performed entirely in table metadata—no data files rewritten
- Downstream tools that hard-code column names may break

:::tip
Best to coordinate with consumers or provide an alias
:::

### Best Practices

- Renaming is safe but requires updating queries Changing a column’s name only affects metadata; underlying data files aren’t rewritten. Any SQL or BI reports that reference the old name must be updated to avoid errors.

- Dropping columns is irreversible—archive data first Once you issue a DROP COLUMN command, Iceberg marks the column as removed in metadata. The original values remain reachable in older table snapshots, but new reads won’t include them. To prevent accidental data loss, export or back up that column’s data before dropping.

- Use schema versioning for rollback if needed Iceberg tracks each schema change in its versioned metadata. By referencing an earlier schema snapshot, you can roll back a problematic rename or drop. This practice ensures you can recover if downstream systems break after a change.

## Reorder Columns

- Purely logical change in metadata; physical file layout remains the same
- Queries see fields in new order, but underlying storage is unaffected
- Useful for cleaner schemas without heavy migration costs

## Change Column Type

- Narrowing conversions (e.g., INT → BIGINT) are usually safe
- Widening or incompatible changes (e.g., STRING → INT) require data rewrite

:::tip
Recommended approach:

- Add new column with desired type
- Backfill data
- Drop old column

:::

### Explanation of Guidelines

- Compatible changes are safe:
Changing from a narrower type to a wider one (for example, INT to BIGINT or VARCHAR(50) to VARCHAR(100)) preserves all existing values without risk of overflow or truncation.

- Incompatible changes can cause data loss:
 Converting from a wider type to a narrower one (for instance BIGINT to INT or VARCHAR(100) to VARCHAR(50)) may truncate data or fail when values exceed the target type’s capacity.

- Always test in a staging environment before production:
Validating your type change on a non-production copy of the dataset helps catch failures or performance regressions before they affect live workloads.

- Prefer adding a new column instead:
Introducing a new column with the desired type and backfilling values allows a gradual migration. Consumers can switch over when ready, avoiding a disruptive in-place change.

- Consider data rewrites if needed:
When neither a straight type change nor a new column is practical, you can perform a targeted ETL that transforms incompatible values into the new type with custom logic before swapping columns.

## Add/Modify Partition Fields (Optional)

- Add new partition spec: Iceberg continues to use legacy spec for old data
- Changing existing spec may require a table rewrite if partitions incompatible
- Always test performance impact before rolling out

## Key Takeaway

Apache Iceberg’s versioned metadata and manifest design ensure that each of these schema changes can be tracked, audited, and, where possible, applied without full table rewrites—keeping your data pipelines robust and flexible.
