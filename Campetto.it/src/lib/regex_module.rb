module RegexModule
    EMAIL = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]{2,}\z/i
    GENDER = /\A[mfu]\z/i

    IT_TAXCODE = /\A\d{11}\z/
    IT_VATNUMBER = /\A\d{11}\z/
    IT_IBAN = /IT\d{2}(\s?[A-z0-9]{4}){5}(\s?[A-z0-9]{3})/
    PHONE_NUMBER = /\A(?:\+39[-]?|39)?(?:3\d{2}[-]?\d{7}|0\d{2}[-]?\d{6,7})\z/

end