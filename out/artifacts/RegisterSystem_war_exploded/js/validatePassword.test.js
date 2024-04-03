const validatePassword = require('./validatePassword')

test('Properly check password format', ()=>{
    expect(validatePassword('1q2w3e4r?')).toBe(true)
})