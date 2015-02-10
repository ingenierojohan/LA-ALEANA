#======================================
# CONFIGURACION DE RUTAS en IRON ROUTER
#======================================

#======================================
# Configuracion General de Iron Router
Router.configure
  loadTemplate: 'loading'
  notFoundTemplate : 'notFound'
# ======================================

#=======================================
# FILTROS de ACCESO onBeforeAction
filters =
# Filtro General
  authGeneral: () ->
    user = Meteor.user()
    unless user
      console.log ">>>> !!! NO ESTOY REGISTRADO !!! ... VAMOS PARA login.html <<<<"
      return @render "login"

    # Si es un Usuario Regsitrado
    if user.profile.rol is "agent"
      console.log ">>>> VAMOS PARA dasboardAgent.html <<<<"
      # Lista de Subscripciones para el dashboardAgent
      @wait [
        #Meteor.subscribe("panelCalls")
        #Meteor.subscribe("siptaxiCallsDay")
        #Meteor.subscribe("servicesDay")
        #Meteor.subscribe("servicesActual")
        #Meteor.subscribe("movilAndPlaca")
      ]
      # Validamos si los Datos se han Cargado
      if @ready()
        return @render "dashboardAgent"
      else
        @render "Loading"

    else
      # Por defecto cuando es un user valido va al dashboard Admin
      console.log ">>>> BIENVENIDO VAMOS PARA dasboardAdmin.html <<<<"
      # Lista de Subscripciones para el dashboardAdmin
      @wait [
        # Meteor.subscribe("panelCalls")
      ]
      if @ready()
        return @render "dashboardAdmin"
      else
        @render "Loading"
# ======================================



#=======================================
# MAPEADO DE RUTAS
Router.map ->
  # Ruta Login
  @route "login",
    path: "/"
    onBeforeAction: filters.authGeneral
# ======================================