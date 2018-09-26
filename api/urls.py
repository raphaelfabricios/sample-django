from django.urls import path
from api.views import EventsView
from rest_framework import routers

#urlpatterns = [
    #path('events/', EventsView.post_list, name="events-all")
#]
router = routers.DefaultRouter()
router.register(r'events', EventsView)

urlpatterns = router.urls