terraform {
  cloud {
    organization = "ce-team-project"

    workspaces {
      name = "ce-team-project"
    }
  }
}