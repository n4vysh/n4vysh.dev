include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = "${dirname(find_in_parent_folders(""))}/base/env.hcl"
}

include "aws_route53_records" {
  path = "${dirname(find_in_parent_folders(""))}/base/modules/aws-route53-records.hcl"
}

dependency "delegation_sets" {
  config_path = "${get_terragrunt_dir()}/../../delegation-sets/"
}

inputs = {
  records = [
    {
      name = ""
      type = "A"
      ttl  = 300
      records = [
        "76.76.21.21",
      ]
    },
    {
      name = "www"
      type = "CNAME"
      ttl  = 300
      records = [
        "cname.vercel-dns.com",
      ]
    },
    {
      name = ""
      type = "MX"
      ttl  = 300
      records = [
        "10 mail.protonmail.ch",
        "20 mailsec.protonmail.ch",
      ]
    },
    {
      name = "protonmail._domainkey"
      type = "CNAME"
      ttl  = 300
      records = [
        "protonmail.domainkey.diy2mbzrrpeixwmtfdlv47vfxsdwcai4wocukj4ovqpcedw5uxmya.domains.proton.ch.",
      ]
    },
    {
      name = "protonmail2._domainkey"
      type = "CNAME"
      ttl  = 300
      records = [
        "protonmail2.domainkey.diy2mbzrrpeixwmtfdlv47vfxsdwcai4wocukj4ovqpcedw5uxmya.domains.proton.ch.",
      ]
    },
    {
      name = "protonmail3._domainkey"
      type = "CNAME"
      ttl  = 300
      records = [
        "protonmail3.domainkey.diy2mbzrrpeixwmtfdlv47vfxsdwcai4wocukj4ovqpcedw5uxmya.domains.proton.ch.",
      ]
    },
    {
      name = ""
      type = "TXT"
      ttl  = 300
      records = [
        "keybase-site-verification=5SuI24_yjjuEK2_wZN1Wl9j1I49OqY43Ylh4QYGShDk",
        "protonmail-verification=07aeea911d0738d5e6bdf038f66b8858779135f2",
        "v=spf1 include:_spf.protonmail.ch mx ~all",
      ]
    },
    {
      name = "_dmarc"
      type = "TXT"
      ttl  = 300
      records = [
        "v=DMARC1; p=quarantine",
      ]
    },
  ]
}
