

# Recursos

Os seguintes recursos e capacidades estão disponíveis na plataforma:

* Linha de ônibus
  * [bus_line_monitoring](bus_monitoring.json) - possui dados em tempo real da posição dos ônibus
  de uma linha
  * [bus_line_metadata](bus_line_metadata.json) - possui dados estáticos das linhas do ônibus como a
  rota e frequencias de horários
* Ônibus (Desligado)
  * [bus_monitoring]() - possui dados de cada ônibus em tempo real
* Estação de BikeSharing
  * [open](bike.json) - informa se uma estação está aberta ou fechada
  * [slots_monitoring](bike.json) - informa a quantidade de bicicletas disponíveis e slots
  disponíveis
* Sensores de Qualidade do Ar
  * [air_quality](air_quality.json)
* Sensores do Clima
  * [weather](weather.json) 


# Requests

* Descoberta de Linhas de Ônibus:
> [/discovery/resources?capability=bus_line_metadata](discovery.json)
* Descobrir recursos em um raio de 300 metros da USP
> /discovery/resources?lat=-23.561320&lon=-46.730832&radius=300
* Descobrir unidades de saúde no raio de 1000 metros do MASP
> /discovery/resources?lat=-23.561443&lon=-46.655796&radius=1000&capability=medical_procedure
*



* Informações de um Recurso:
> [/catalog/resources/de4c754b-22c6-4e53-a7b1-5a86024902fa](resource_static_data.json)
* Informações paginadas dos Recursos
> [/catalog/resources/](all_resources.json)
* Informações da segunda página de Recursos, considerando 200 recursos por página
> [/catalog/resources?page=2&per_page=200](200_resources_page_2.json)


* Dados estáticos de uma linha de ônibus
> [curl -H "Content-Type: application/json" -X POST http://143.107.45.126:30134/collector/resources/a821fc2e-9eb0-44d7-8d19-1fecdb4e1c80/data/](bus_line_metadata.json)
* Dados estáticos de uma parada de ônibus
> [curl -H "Content-Type: application/json" -X POST http://143.107.45.126:30134/collector/resources/7ef186f6-197d-40ae-88d0-e6eb0b2ba4fd/data/](bus_stop_metadata.json)
* Dados de qualidade do ar de um recurso 
> [curl -H "Content-Type: application/json" -X POST http://143.107.45.126:30134/collector/resources/e2b74a8e-e0fd-424d-9fb6-14902b44ffff/data/](air_quality.json)
* Dados do clima de um recurso
> [curl -H "Content-Type: application/json" -X POST http://143.107.45.126:30134/collector/resources/e2b74a8e-e0fd-424d-9fb6-14902b44ffff/data/](weather.json)
