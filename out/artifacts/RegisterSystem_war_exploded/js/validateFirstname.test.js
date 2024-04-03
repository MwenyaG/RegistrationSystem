const validateFirstname = require('./validateFirstname')

test('Properly check first name format', ()=>{
    expect(validateFirstname('KOUQIN')).toBe(true)
})