const validateLastname = require('./validateLastname')

test('Properly check last name format', ()=>{
    expect(validateLastname('XIONG')).toBe(true)
})