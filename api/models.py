from django.db import models

class Events(models.Model):
    EventId = models.AutoField(primary_key=True)
    Component = models.CharField(max_length=255, null=False)
    Version = models.CharField(max_length=255, null=False)
    Responsible = models.CharField(max_length=255, null=False)
    Status = models.CharField(max_length=255, null=False)
    Date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self
