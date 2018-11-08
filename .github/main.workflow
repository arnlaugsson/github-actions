workflow "deploy on push" {
  action "build" {
    npm install
  }
  action "test" {
    npm test
  }
}
