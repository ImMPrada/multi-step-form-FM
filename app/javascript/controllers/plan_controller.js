import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Hello, Stimulus! from toggle", this.element)
  }

  changePlanFrequence(event) {
    console.log("Hello, Stimulus! from toggle, click", this.element)

    const isYearlyPlan = event.target.checked
    const monthlyToggleLabel = (document.getElementById(`${event.target.id}_monthly`))
    const yearlyToggleLabel = (document.getElementById(`${event.target.id}_yearly`))
    const yearlyCards = (document.getElementById("yearly_plans_options"))
    const monthlyCards = (document.getElementById("monthly_plans_options"))
    const cards = (document.getElementsByName("plan[plan]"))

    cards.forEach((card) => {
      card.checked = false
    })

    monthlyToggleLabel.classList.remove("text-dark")
    monthlyToggleLabel.classList.remove("text-soft-gray")
    yearlyToggleLabel.classList.remove("text-dark")
    yearlyToggleLabel.classList.remove("text-soft-gray")

    if (isYearlyPlan) {
      yearlyCards.style = "display: flex;"
      monthlyCards.style = "display: none;"
      yearlyToggleLabel.classList.add("text-dark")
      monthlyToggleLabel.classList.add("text-soft-gray")
    } else {
      yearlyCards.style = "display: none;"
      monthlyCards.style = "display: flex;"
      monthlyToggleLabel.classList.add("text-dark")
      yearlyToggleLabel.classList.add("text-soft-gray")
    }
  }
}
