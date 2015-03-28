module.exports = class CRUDService extends (require 'chas').Service

  constructor: (@_channel) ->
    super
    @_actions = [
      'index', 'create', 'read', 'update', 'destroy',
    ]

  index: (resource, id, params = {}) ->
    unless resource = @_resources[resource]
      throw new Error "Missing resource: #{resource}"

    resource.index id, params, (err, res) =>
      unless @_hasError err, res then @_channel.write result:res

  create: (resource, id, params = {}) ->
    unless resource = @_resources[resource]
      throw new Error "Missing resource: #{resource}"

    resource.create id, params, (err, res) =>
      unless @_hasError err, res then @_channel.write result:res

  read: (resource, id, params = {}) ->
    unless resource = @_resources[resource]
      throw new Error "Missing resource: #{resource}"

    resource.read id, params, (err, res) =>
      unless @_hasError err, res then @_channel.write result:res

  update: (resource, id, params = {}) ->
    unless resource = @_resources[resource]
      throw new Error "Missing resource: #{resource}"

    resource.update id, params, (err, res) =>
      unless @_hasError err, res then @_channel.write result:res

  destroy: (resource, id, params = {}) ->
    unless resource = @_resources[resource]
      throw new Error "Missing resource: #{resource}"

    resource.destroy id, params, (err, res) =>
      unless @_hasError err, res then @_channel.write result:res
