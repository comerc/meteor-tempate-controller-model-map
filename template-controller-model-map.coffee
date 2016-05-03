TemplateControllerModelMap = {}

TemplateControllerModelMap.validateOne = (variable, value) ->
  fieldName = @modelMap[variable]
  doc = {}
  doc[fieldName] = value
  result = @validationContext.validateOne(doc, fieldName)
  if result
    @state.errorMessages = []
  else
    @state.errorMessages = _.map @validationContext.getErrorObject().invalidKeys,
      TemplateControllerModelMap.getErrorMessage, @
  return result

TemplateControllerModelMap.getErrorMessage = (error) ->
  return " #{error.message}"

TemplateControllerModelMap.getValidData = (collectionName) ->
  # TODO collectionName
  data = {}
  for variable, fieldName of @modelMap
    data[fieldName] = @state[variable]
  if @validationContext.validate(data)
    @state.errorMessages = []
  else
    @state.errorMessages = _.map @validationContext.getErrorObject().invalidKeys,
      TemplateControllerModelMap.getErrorMessage, @
    return false
  return data

TemplateControllerModelMap.init = (@validationContext, @modelMap) ->
  # init state
  # TODO init with default values from ss
  for variable of @modelMap
    @state.addProperty variable, ''
  @state.addProperty 'errorMessages', []
