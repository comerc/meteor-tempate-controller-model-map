TemplateControllerModelMap = {}

TemplateControllerModelMap.validateOne = (variable, value) ->
  fieldName = @modelMap[variable]
  doc = {}
  doc[fieldName] = value
  result = @validationContext.validateOne(doc, fieldName)
  if result
    @state.errorMessages []
  else
    @state.errorMessages _.map @validationContext.getErrorObject().invalidKeys,
      TemplateControllerModelMap.getErrorMessage, @
  return result

TemplateControllerModelMap.getErrorMessage = (error) ->
  return " #{error.message}"

TemplateControllerModelMap.getValidData = (collectionName) ->
  # TODO collectionName
  data = {}
  for variable, fieldName of @modelMap
    data[fieldName] = @state[variable]()
  if not @validationContext.validate(data)
    @state.errorMessages _.map @validationContext.getErrorObject().invalidKeys,
      TemplateControllerModelMap.getErrorMessage, @
    return false
  return data

TemplateControllerModelMap.init = (@validationContext, @modelMap) ->
  # init state
  for variable of @modelMap
    @state[variable] = generateReactiveAccessor('')
  @state.errorMessages = generateReactiveAccessor([])

generateReactiveAccessor = (defaultValue) ->
  value = new ReactiveVar(defaultValue)
  (newValue) ->
    if newValue != undefined
      value.set newValue
    else
      return value.get()
    return
