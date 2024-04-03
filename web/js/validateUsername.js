/**
 * Validate whether username meets the requirement that:
 * length must be between 4 and 20, contains only A-Z, a-z, 0-9 and _
 * @param string value of the username input field
 * @returns {boolean} return true if the requirement is met; ; otherwise false
 */
const validateUsername = function (txt) {
    const uPattern = /^[a-zA-Z0-9_]{4,20}$/;
    return uPattern.test(txt);
};

module.exports = validateUsername