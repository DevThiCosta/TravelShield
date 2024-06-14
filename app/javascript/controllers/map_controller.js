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


    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [ -43.180856, -22.791097 ],
      zoom: 8.5
    })
    console.log(this.dangerAreasValue)
    this.addMarkersToMap()
    this.fitMapToMarkers()
  }

  addMarkersToMap() {

    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })

    // Add danger areas to map
    this.dangerAreasValue.forEach((dangerArea) => {
      new mapboxgl.Marker({ color: 'red' })
        .setLngLat([ dangerArea.lng, dangerArea.lat ])
        .addTo(this.map)
    })
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.concat(this.dangerAreasValue).forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 10.2, duration: 0 })
  }
}
