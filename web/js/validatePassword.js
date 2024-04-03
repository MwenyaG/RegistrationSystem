const isAlphabet = function (i) {
    return (i >= 'a' && i <= 'z') || (i >= 'A' && i <= 'Z');
}

const isDigit = function (i) {
    return (i >= '0' && i <= '9');
}

const isSupportedSymbol = function (i) {
    if (i == '!' || i == '@' || i == '#' || i == '$' || i == '%' || i == '^' || i == '&' || i == '*' || i == '?') {
        return true;
    }
    return false;
}

/**
 * Validate whether password meets the requirement that:
 * must have the length of 9, with 4 alphabets, 4 digits and 1 special symbol from [!@#$%^&*?]; also shall not be followed character with character or digit with digit
 * For example:
 *
 * Valid Cases:
 * 1. 1q2w3e4r?
 * 2. q*0w1e5f8
 *
 * Invalid Cases:
 * 1. 1234qwer*
 * 2. 1q2w3e%
 * 3. 12qw3e4r&
 *
 * @param string value of the password input field
 * @returns {boolean} return true if the requirement is met; ; otherwise false
 */
const validatePassword = function (txt) {
    // 1. check the length first
    if (txt.length != 9) {
        return false;
    }

    // 2. check whether it has 4 alphabets, 4 digits and 1 special symbol
    let countAlphabet = 0;
    let countDigit = 0;
    let countSymbol = 0;

    for (const c of txt) {
        if (isAlphabet(c)) {
            countAlphabet++;
        }
        if (isDigit(c)) {
            countDigit++;
        }
        if (isSupportedSymbol(c)) {
            countSymbol++;
        }
    }

    if(!(countAlphabet == 4 && countDigit == 4 && countSymbol == 1)){
        return false;
    }else{
        // 3. check whether a digit is followed by another digit
        // or an alphabet is followed by another alphabet

        // the variable "lastOne" is to record which category the last character belongs to
        // where:
        // 0 (default)
        // 1 alphabet
        // 2 digit
        // 3 special symbol
        let lastOne = 0;

        // iterate the string, get the category of the current character
        // if it is the same as the lastOne
        // return false
        // otherwise
        // continue
        for(const c of txt){
            let thisOne;
            if(isAlphabet(c)){
                thisOne = 1;
            }else if(isDigit(c)){
                thisOne = 2;
            }else if(isSupportedSymbol(c)){
                thisOne = 3;
            }

            if(lastOne == thisOne){
                return false;
            }
            lastOne = thisOne;
        }

        return true;
    }
}

module.exports = validatePassword