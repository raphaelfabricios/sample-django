from django.test import TestCase
from api.models import Events

class EventsTest(TestCase):
    def SetUp(self):
        """
        Objetivo: validar a criação do objeto no BD
        """
        Events.objects.create(
            Component='ComponentSample',
            Version = '1',
            Responsible = 'Jose',
            Status = 'Failed'
            )
    
    def Check_event_created(self):
        SetUp()
        self.assertIs(Events.objects.count(), '1')

