from django.db import models


class Registro(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField(blank=True)
    creado = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.nombre
