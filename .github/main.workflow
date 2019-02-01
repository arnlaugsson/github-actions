workflow "deploy on push" {
  on = "push"
  resolves = "notify"
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

action "notify" {
  needs = ["test", "lint"]
  uses = "actions/bin/sh@master"
  args = ["echo \"I finally did it!\""]
}
