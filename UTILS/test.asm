metasprites:
ms00:
db $00, $02, $04, $FF, 
ms01:
db $06, $08, $0A, $FF, 
ms02:
db $0C, $0E, $10, $12, $14, $FF, 
ms03:
db $16, $18, $1A, $1C, $1E, $FF, 
ms04:
db $20, $0E, $10, $12, $22, $FF, 
ms05:
db $24, $26, $28, $2A, $2C, $FF, 
ms06:
db $2E, $30, $32, $FF, 
ms07:
db $34, $36, $38, $FF, 
ms08:
db $3A, $3A, $3C, $3E, $40, $FF, 
ms09:
db $42, $44, $46, $48, $4A, $FF, 
ms0A:
db $4C, $4C, $4E, $50, $52, $FF, 

metaspritePtrs:
db HIGH(ms00), LOW(ms00), HIGH(ms01), LOW(ms01), HIGH(ms02), LOW(ms02), HIGH(ms03), LOW(ms03), HIGH(ms04), LOW(ms04), HIGH(ms05), LOW(ms05), HIGH(ms06), LOW(ms06), HIGH(ms07), LOW(ms07), HIGH(ms08), LOW(ms08), HIGH(ms09), LOW(ms09), HIGH(ms0A), LOW(ms0A), 