import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal", "employementFields", "dynamicEmploymentFields", "employerFormSubmitBtn"];

  connect() {
    this.employerFormSubmitBtnTarget.dataset['action'] = null;
    this.employerFormSubmitBtnTarget.style.backgroundColor = "rgb(235, 235, 228)"
  }

  hideModal() {
    this.element.parentElement.removeAttribute("src");
    this.modalTarget.remove();
  }

  submitEnd(e) {
    if (e.detail.success) {
      this.hideModal();
    }
  }

  checkEmploymentFormValidity(e) {
    
    let isValid = true;
    let action = "click->employer-modal#submitEmploymentForm"
    const employmentFields = document.querySelectorAll('[name="employer[employment]"]');
    const startDateFields = document.querySelectorAll('[name="employer[start_date]"]')
    const endDateFields = document.querySelectorAll('[name="employer[end_date]"]')
    if(employmentFields.length > 0) {
      employmentFields.forEach(elem => {
        if(elem.value === '') {
          isValid = false
        }
      })
    }

    if(startDateFields.length > 0) {
      startDateFields.forEach(elem => {
        if(elem.value === '') {
          isValid = false
        }
      })
    }

    if(endDateFields.length > 0) {
      endDateFields.forEach(elem => {
        if(elem.value === '') {
          isValid = false
        }
      })
    }
    this.employerFormSubmitBtnTarget.style.backgroundColor = isValid ? "rgb(37 99 235)" : "rgb(235, 235, 228)"
    this.employerFormSubmitBtnTarget.dataset['action'] = isValid ? action : null 
  }

  submitEmploymentForm(e) {
    const data = [];
    const selectedUser = document.getElementById("employer_profile_id").value;
    const employmentFields = document.querySelectorAll('[name="employer[employment]"]');
    const startDateFields = document.querySelectorAll('[name="employer[start_date]"]')
    const endDateFields = document.querySelectorAll('[name="employer[end_date]"]')

    employmentFields.forEach((elem, index) => {
      data.push({
        'profile_id': selectedUser,
        'employment': elem.value,
        'start_date': startDateFields[index]?.value,
        'end_date': endDateFields[index]?.value
       })
    })

    fetch('/employers', {
      method: 'POST',
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(data)
    }).then(response => {
      this.closeBackground();
      this.employerFormSubmitBtnTarget.dataset['action'] = null;
      this.employerFormSubmitBtnTarget.style.backgroundColor = "rgb(235, 235, 228)"
    })
  }

  addEmployementFields(e) {
    const element = document.getElementById("employement-fields").cloneNode(true);
    document.getElementById("new-employement-fields").appendChild(element);
  }

  closeWithKeyboard(e) {
    if (e.code == "Escape") {
      this.hideModal();
    }
  }

  closeBackground(e) {
    if (e && this.modalTarget.contains(e.target)) {
      return;
    }
    this.hideModal();
  }

  validateForm() {
    let isValid = true;

    // Tell the browser to find any required fields
    let requiredFieldSelectors = "input:required";
    let requiredFields = this.modalTarget.querySelectorAll(
      requiredFieldSelectors
    );

    requiredFields.forEach((field) => {
      if (!field.disabled && !field.value.trim()) {
        field.focus();

        isValid = false;
      }
    });

    return isValid;
  }
}
