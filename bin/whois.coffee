#!/usr/bin/env coffee
domain = process.argv[2]
if !domain? or domain is '-h' or domain is '--help' or process.argv[3]?
  console.error 'Usage: %s <domain>', __filename
  process.exit(0)

handleError = (err) ->
  console.error(err.toString())
  process.exit(1)

dns = require 'dns'
dns.lookup domain, (err, ip) ->
  return handleError(err) if err?
  console.log(ip)
