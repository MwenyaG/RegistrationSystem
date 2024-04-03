const validateUsername = require('./validateUsername')

test('Properly check username format', ()=>{
    expect(validateUsername('kouqinx_x')).toBe(true)
})