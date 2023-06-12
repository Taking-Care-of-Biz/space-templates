resource "coder_agent" "iipod" {
  arch = "amd64" # Intel
  # arch = "arm64" # Arm
  os  = "linux" # Linux
  dir = "$HOME" # Could set to somewhere
  # login_before_ready = true
  startup_script = file("./iipod-agent-startup.sh")
  env = {
    # GITHUB_TOKEN        = "$${data.coder_git_auth.github.access_token}"
    # GITHUB_TOKEN        = "$${var.GITHUB_TOKEN}"
    ORGURL              = data.coder_parameter.org-url.value
    GITURL              = data.coder_parameter.git-url.value
    SESSION_NAME        = "${lower(data.coder_workspace.ii.name)}"
    GIT_AUTHOR_NAME     = "${data.coder_workspace.ii.owner}"
    GIT_COMMITTER_NAME  = "${data.coder_workspace.ii.owner}"
    GIT_AUTHOR_EMAIL    = "${data.coder_workspace.ii.owner_email}"
    GIT_COMMITTER_EMAIL = "${data.coder_workspace.ii.owner_email}"
  }
}