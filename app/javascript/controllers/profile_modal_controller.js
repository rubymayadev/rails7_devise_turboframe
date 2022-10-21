import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "modal",
    "phoneField",
    "emailAddressField",
    "emailErrorField",
  ];

  // hide modal
  // action: "profile-modal#hideModal"
  hideModal() {
    this.element.parentElement.removeAttribute("src");
    // Remove src reference from parent frame element
    // Without this, profile won't re-open the modal on subsequent click
    this.modalTarget.remove();
  }

  // hide modal on successful form submission
  // action: "profile:submit-end->profile-modal#submitEnd"
  submitEnd(e) {
    if (e.detail.success) {
      this.hideModal();
    }
  }

  validatePhone(e) {
    
    let value = this.phoneFieldTarget.value;
    let lastEnteredInput = value.length > 1 ? value.replaceAll('-', '').substr(0, value.length -1) : value;

    if(lastEnteredInput.match('^[0-9]*$') === null) {
      this.phoneFieldTarget.value = value.substring(0, value.length -1)
      return;
    }

    if(value.length > 12 && e.inputType === "insertText") {
      this.phoneFieldTarget.value = value.substring(0, value.length -1)
      return
    }
    if(value.length === 3 && e.inputType === "insertText") {
      this.phoneFieldTarget.value = value + '-'
      return
    }
    if(value.length === 7 && e.inputType === "insertText") {
      this.phoneFieldTarget.value = value + '-'
      return
    }
    
  }


  validateEmail(e) {
    let value = this.emailAddressFieldTarget.value;
    let isValidate =
      /^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{3,4}|\d+)$/i.test(value);

    if (isValidate) {
      this.emailAddressFieldTarget.value = value.substring(0, value.length);
      this.emailErrorFieldTarget.style.display = "none";
    } else {
      this.emailErrorFieldTarget.style.display = "block";
    }
  }

  // hide modal when clicking ESC
  // action: "keyup@window->profile-modal#closeWithKeyboard"
  closeWithKeyboard(e) {
    if (e.code == "Escape") {
      this.hideModal();
    }
  }

  // hide modal when clicking outside of modal
  // action: "click@window->profile-modal#closeBackground"
  closeBackground(e) {
    if (e && this.modalTarget.contains(e.target)) {
      return;
    }
    this.hideModal();
  }

  submitForm(e) {
    let isValid = this.validateForm(this.modalTarget);

    // If our form is invalid, prevent default on the event
    // so that the form is not submitted
    if (!isValid) {
      e.preventDefault();
    }
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
