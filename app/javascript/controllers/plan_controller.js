import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { frequency: String }

  connect() {
    console.log("Hello, Stimulus! from toggle", this.element)
  }

  changePlanFrequence(event) {
    console.log("Hello, Stimulus! from toggle", this.element)
    const isYearlyPlan = event.target.checked
    const yearlyCards = (document.getElementById("yearly_plans_options"))
    const monthlyCards = (document.getElementById("monthly_plans_options"))
    const cards = (document.getElementsByName("plan[plan]"))

    cards.forEach((card) => {
      card.checked = false
    })

    if (isYearlyPlan) {
      yearlyCards.style = "display: flex;"
      monthlyCards.style = "display: none;"
    } else {
      yearlyCards.style = "display: none;"
      monthlyCards.style = "display: flex;"
    }
  }
}