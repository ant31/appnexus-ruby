require 'dalli'

require 'openapi'
require 'appnexus/auth_token'
require 'appnexus/models'
require 'appnexus/handlers'
require 'appnexus/routes'
require 'appnexus/client'

# LAST

## MOVE TO APP ""
require 'logger'
AppNexus::Models::AppNexusBase.include_root_in_json = true
AppNexus.user = "2t.antoine"
AppNexus.password = "jamdEal3F!"
AppNexus.site  = "api.appnexus.com"
AppNexus.use_ssl  = true
AppNexus.logger = Logger.new(STDOUT)
OpenAPI.cache = Dalli::Client.new('localhost:11211', { :namespace => "openapi", :compress => false })
OpenAPI.logger = AppNexus.logger

AppNexus::Routes.generate
