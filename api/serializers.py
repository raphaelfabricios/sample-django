from rest_framework import serializers
from .models import Events

class EventsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Events
        fields = (
            "Component",
            "Version",
            "Responsible",
            "Status",
            "Date",
            "EventId",
        )

# Create your views here.
