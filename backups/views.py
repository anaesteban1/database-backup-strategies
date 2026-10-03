from django.shortcuts import redirect, render
from django.db import connection
from .models import Registro


def inicio(request):
    if request.method == "POST":
        nombre = request.POST.get("nombre", "").strip()
        descripcion = request.POST.get("descripcion", "").strip()

        if nombre:
            Registro.objects.create(
                nombre=nombre,
                descripcion=descripcion
            )

        return redirect("inicio")

    registros = Registro.objects.order_by("-creado")

    motor = connection.vendor.upper()

    return render(
        request,
        "backups/inicio.html",
        {
            "registros": registros,
            "motor": motor,
        },
    )


def health(request):
    from django.http import JsonResponse

    return JsonResponse({
        "status": "ok",
        "application": "Database Backup Strategies"
    })
