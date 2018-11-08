workflow "deploy on push" {
  on = "push"
  resolves = "deploy"
}

action "build" {
  uses = "actions/npm@master"
  args = "install"
}

action "test" {
  needs = "build"
  uses = "actions/npm@master"
  args = "test"
}

action "lint" {
  needs = "build"
  uses = "actions/npm@master"
  args = "run lint"
}

action "deploy" {
  needs = ["test", "lint"]
  uses = "actions/zeit-now@master"
  secrets = ["ZEIT_TOKEN"]
}
