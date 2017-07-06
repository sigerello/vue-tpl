# vue-tpl

This is simple but opinionated project template for developing [vuejs](https://vuejs.org/) projects.

This template uses:

- [yarn](https://yarnpkg.com/)
- [webpack](https://webpack.js.org/)
- [coffeescript](http://coffeescript.org/v2/)
- [scss](http://sass-lang.com/)
- [pug](https://pugjs.org/)
- [bootstrap](https://v4-alpha.getbootstrap.com/)


### How to use

First, install [yarn](https://yarnpkg.com/en/docs/install) package manager.

Then run these commands to generate a project:

```bash
npm install vue-cli -g
vue init sigerello/vue-tpl my-project
cd my-project
yarn
```

Create ```.env.dev``` and ```.env.prod``` files and set appropriate environments variables there:

```bash
cp .env.example .env.dev
cp .env.example .env.prod
```

Run dev-server:

```bash
yarn dev
```

Generate production build:

```bash
yarn prod:build
```

Run websever on production build:

```bash
yarn prod:server
```

