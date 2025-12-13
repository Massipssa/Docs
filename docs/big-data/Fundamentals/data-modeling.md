# Data Modeling

The way the data relates the real words. It reflects how the data must be structred and standardized to best reflects your organization's definitons, workflows, and logic.

# Data Modeling

- What are you measuring
- What type of busniss problem are you trying to solve
- How much data are you working with
- What are your data sources

## What's a Good model

- Easly undestoond and consumable
- Large data changes are scalable
- Provide predictable performance
- Flexible and adaptable, but not at the expence of other atttibutes

## Model types

- Conceptuel Model: High level of what we'are thing
- Logical Model
- Physical model
  - metada info level
  - PK, FK

## Start Schema

Fact table (main table) in the midddle
Surrounded by Dim (descriptive table)
Lools like a Star
Fact table is 'Many' side of the (one to many relationship)

## Dimensional Model

Organizes the data so it is easy to retrieve for reporting purposes

### Fact tables

A fact is an event that may or may not include measures

### Dimensional tables (wide table)

A category of information, oa noun, descriptive (to expalain our dimension)
Natural key

### Attribute (Column in dimension table)

Descriptor of the object
