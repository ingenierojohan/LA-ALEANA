#==============================================
# FUNCIONES y HELPERS que se Ejecutan al Inicio
#==============================================

#=================================
# Obtener la Hora del Sistema
Template.registerHelper "fechaSistema", ->
  moment().format("dddd, DD  MMMM  YYYY, h:mm:ss a")
#=================================
