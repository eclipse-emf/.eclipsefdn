local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('modeling.emf.emf', 'eclipse-emf') {
  settings+: {
    blog: "https://www.eclipse.org/emf",
    description: "Provides code generation facilities for building tools and applications based on a structured data model.",
    email: "emf-dev@eclipse.org",
    name: "Eclipse Modeling Framework",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/emf/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('emf-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.emf') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      has_discussions: true,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
}
