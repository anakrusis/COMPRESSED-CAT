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
ms0B:
db $54, $56, $58, $FF, 
ms0C:
db $5A, $5C, $5E, $FF, 
ms0D:
db $0C, $0E, $10, $60, $62, $FF, 
ms0E:
db $16, $18, $1A, $1C, $1E, $FF, 
ms0F:
db $64, $66, $68, $6A, $6C, $FF, 
ms10:
db $6E, $70, $72, $74, $2C, $FF, 

metaspritePtrs:
db HIGH(ms00), LOW(ms00), HIGH(ms01), LOW(ms01), HIGH(ms02), LOW(ms02), HIGH(ms03), LOW(ms03), HIGH(ms04), LOW(ms04), HIGH(ms05), LOW(ms05), HIGH(ms06), LOW(ms06), HIGH(ms07), LOW(ms07), HIGH(ms08), LOW(ms08), HIGH(ms09), LOW(ms09), HIGH(ms0A), LOW(ms0A), HIGH(ms0B), LOW(ms0B), HIGH(ms0C), LOW(ms0C), HIGH(ms0D), LOW(ms0D), HIGH(ms0E), LOW(ms0E), HIGH(ms0F), LOW(ms0F), HIGH(ms10), LOW(ms10), 