import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    dangerAreas: Array,
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.defaultStyle = "mapbox://styles/thiscostaa/clxcslv5x025y01po7d85hj95"
    this.satelliteStyle = "mapbox://styles/mapbox/satellite-v9"
    this.isSatelliteView = false

    this.map = new mapboxgl.Map({
      container: this.element,
      style: this.defaultStyle,
      center: [-43.180856, -22.791097],
      zoom: 8.5
    })
    console.log(this.dangerAreasValue)
    this.addMarkersToMap()
    this.fitMapToMarkers()
  }

  addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    })

    // Add danger areas to map
    this.dangerAreasValue.forEach((dangerArea) => {
      new mapboxgl.Marker({ color: 'red' })
        .setLngLat([dangerArea.lng, dangerArea.lat])
        .addTo(this.map)
    })
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.concat(this.dangerAreasValue).forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 10.2, duration: 0 })
  }

  toggleMapView() {
    this.isSatelliteView = !this.isSatelliteView
    const newStyle = this.isSatelliteView ? this.satelliteStyle : this.defaultStyle
    this.map.setStyle(newStyle)
    // Optionally update button text
    const button = document.getElementById('toggle-map-view')
    button.innerText = this.isSatelliteView ? 'Default View' : 'Satellite View'

    // Re-add markers and fit bounds after style is loaded
    this.map.on('style.load', () => {
      this.addMarkersToMap()
      this.fitMapToMarkers()
    })
  }
}
