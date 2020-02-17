use Proyecto_Titulo
select*from medicamentos 
where [Nombre Medicamento] like '%valproico%'  order by [Nombre Medicamento]


select [Hora Reserva],[Fecha Reserva],[Reserva de Hora].[Rut Medico],[Estado Reserva] from Medico,[Reserva de Hora]
where Medico.[Rut Medico]=[Reserva de Hora].[Rut Medico] and [Fecha Reserva]='27-12-2018' and Especialidad='Cardiologo'
