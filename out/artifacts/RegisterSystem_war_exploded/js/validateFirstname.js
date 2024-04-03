/**
 * Validate whether firstname meets the requirement that:
 * length must be at least 1, contains only A-Z, a-z, space
 * For example:
 * K, Kou Qin, OK; XIONG123 WRONG
 * @param string value of the first name input field
 * @returns {boolean} return true if the requirement is met; otherwise false
 */
const validateFirstname = function (txt){
    const uPattern = /^[a-zA-Z ]{1,16}$/;
    return uPattern.test(txt);
};

module.exports = validateFirstname