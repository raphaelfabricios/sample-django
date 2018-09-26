from django.shortcuts import render
from rest_framework import generics, viewsets, routers
from api.models import Events
from api.serializers import EventsSerializer

class EventsView(viewsets.ModelViewSet):
    """
    Provides a get method handler.
    """
    queryset = Events.objects.all()
    serializer_class = EventsSerializer



# Create your views here.
