import React, { type ReactElement, type ReactNode } from 'react';
import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.SVGProps<SVGSVGElement>>;
  description: ReactNode;
};

const featureList: FeatureItem[] = [
  {
    title: 'TODO',
    Svg: require('@site/static/img/undraw_docusaurus_mountain.svg').default,
    description: (
      <>TODO</>
    ),
  },
  {
    title: 'TODO',
    Svg: require('@site/static/img/undraw_docusaurus_tree.svg').default,
    description: (
      <>TODO</>
    ),
  },
  {
    title: 'TODO',
    Svg: require('@site/static/img/undraw_docusaurus_react.svg').default,
    description: (
      <>TODO</>
    ),
  },
];

function Feature({ title, Svg, description }: FeatureItem): ReactElement {
  return (
    <div className={clsx('col col--4', styles.featureItem)}>
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" aria-label={title} />
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): ReactElement {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {featureList.map((item) => (
            <Feature key={item.title} {...item} />
          ))}
        </div>
      </div>
    </section>
  );
}
