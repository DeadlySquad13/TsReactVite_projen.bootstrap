import { web } from 'projen';
const project = new web.ReactTypeScriptProject({
  defaultReleaseBranch: 'main',
  name: 'test',
  projenrcTs: true,

  // deps: [],                /* Runtime dependencies of this module. */
  // description: undefined,  /* The description is just a string that helps people understand the purpose of the package. */
  // devDeps: [],             /* Build dependencies for this module. */
  // packageName: undefined,  /* The "name" in package.json. */
});

const installTask = project.tasks.tryFind('install');
if (installTask) {
  installTask.reset('yarn install');
}

const installCiTask = project.tasks.tryFind('install:ci');
if (installCiTask) {
  installCiTask.reset('yarn install --frozen-lockfile');
}

project.synth();
