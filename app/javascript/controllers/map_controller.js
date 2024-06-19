import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    dangerAreas: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [-43.180856, -22.791097],
      zoom: 8.5
    })

    this.addMarkersToMap()
    this.fitMapToMarkers()
  }

  addMarkersToMap() {
    // Adiciona marcadores normais
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    })

    // Adiciona áreas perigosas ao mapa
    this.dangerAreasValue.forEach((dangerArea) => {
      const marker = new mapboxgl.Marker({ color: 'red' })
        .setLngLat([dangerArea.lng, dangerArea.lat])
        .addTo(this.map)

      // Adiciona evento de clique ao marcador
      marker.getElement().addEventListener('click', () => {
        this.showDangerAreaPopup(dangerArea)
      })
    })
  }

  showDangerAreaPopup(dangerArea) {
    console.log('Danger area clicked:', dangerArea) // Informação de depuração

    // Cria o popup
    const popup = new mapboxgl.Popup()
      .setLngLat([dangerArea.lng, dangerArea.lat])
      .setHTML(`<a href="/danger_areas/${dangerArea.id}" class="text-decoration-none text-dark">${dangerArea.name}</a>`)
      .addTo(this.map)

    // Opcional: Log popup para depuração
    console.log('Popup created:', popup)
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.concat(this.dangerAreasValue).forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 10.2, duration: 0 })
  }
}
