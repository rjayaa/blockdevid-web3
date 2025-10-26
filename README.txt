# Ethereum Jakarta - Workshop Notes

## Dokumentasi Referensi

- Dokumentasi Resmi: [ETH Jakarta - Sesi 1 Batch 4](https://docs.ethjkt.com/docs/Kelas-Rutin-IV/Sesi-1-Deep-Web3-Fundamentals-Infra-Setup/sesi-1-batch-4-offline)
- Roadmap Fullstack: [Ethereum Jakarta GitHub](https://github.com/Ethereum-Jakarta/fullstack-web3-roadmap)

---

## Session 1: Deep Web3 Fundamentals & Infrastructure Setup

### Blockchain Fundamentals

#### Validator & Consensus
- Validator berasal dari masing-masing komputer/node yang berpartisipasi dalam jaringan
- Validator bertugas memvalidasi transaksi dan membuat blok baru

#### Blockchain as Layer 1 Infrastructure
- Blockchain (seperti Ethereum) adalah dasar infrastruktur untuk Layer 2

#### Layer 1 - RPC (Remote Procedure Call)
- RPC adalah interface untuk berkomunikasi dengan blockchain
- Contoh: `https://rpc.sepolia-api.lisk.com`
- RPC memungkinkan aplikasi mengirim transaksi dan membaca data dari blockchain

---

### Blockchain Opportunities

#### Business Model
- Revenue dari Transaksi: Setiap transaksi yang berjalan di atas blockchain menghasilkan fee
- Fee ini dibagikan ke validator dalam jaringan
- Semakin banyak transaksi, semakin banyak revenue

#### Cryptocurrency Utility
- Utilitas cryptocurrency seperti membuat PT yang sedang menuju IPO
- Token/coin harus punya use case dan value proposition yang jelas
- Baca whitepaper setiap project untuk memahami blueprint dan vision mereka

---

### Blockchain Trilemma

Setiap blockchain harus memilih 2 dari 3 aspek ini:

```
         Decentralization
              /\
             /  \
            /    \
           /      \
    Security ---- Scalability
```

Trade-offs:
- High Security + Decentralization = Low Scalability (Bitcoin, Ethereum L1)
- High Security + Scalability = Low Decentralization (Some L2s)
- High Decentralization + Scalability = Compromised Security

---

### Gas Fee System

#### Satuan Gas
- Wei - Unit terkecil (10⁻¹⁸ ETH)
- Gwei - Gas price standard (10⁻⁹ ETH)
- ETH - Unit standar

#### Status Jaringan
Cara melihat kondisi jaringan:
- Low Traffic: Gas price 5-20 Gwei
- Medium: Gas price 20-50 Gwei  
- High Traffic: Gas price 50-100 Gwei
- Congested: Gas price 100+ Gwei

Tools untuk monitoring:
- Etherscan Gas Tracker
- Block Explorer masing-masing chain

---

### Smart Contract Basics

#### Visibility & State Management
- Public functions: Dapat diubah dan dipanggil dari mana saja
- Private/Internal: Hanya untuk contract atau inheritance
- Data storage: Semua data tersimpan di blockchain, bukan database konvensional

#### Development Workflow
- Setiap development memerlukan koneksi ke jaringan blockchain (testnet/mainnet)
- Tidak menggunakan database tradisional (MySQL, PostgreSQL, dll)
- State management dilakukan on-chain melalui smart contract

#### Gas Cost
- Setiap perubahan state/data kena gas fee
- Read operations (view/pure) gratis jika dipanggil dari luar
- Write operations selalu membutuhkan gas

---

### Program & Ekosistem

#### Ambassador Programs
- Arbitrum Ambassador Program - Opportunity untuk kontribusi ke ekosistem
- Program serupa ada di berbagai blockchain (Optimism, Polygon, dll)
- Manfaat: Networking, learning, dan potential rewards

#### Perbedaan Ekosistem
Setiap blockchain punya karakteristik berbeda:
- Ethereum: Most decentralized, highest security
- Layer 2s: Higher scalability, lower cost
- Alt L1s: Different trade-offs and innovations

---

## Session 2: Backend Integration & Data Management

### Block Number System

#### Fungsi Block Number
- Block number berfungsi seperti UUID atau reference ID
- Digunakan untuk refer ke data transaksi tertentu di smart contract
- Setiap transaksi tercatat di block dengan nomor unik

#### Struktur Data
```
Block #12345678
  └─ Transaction 1 (Hash: 0xabc...)
  └─ Transaction 2 (Hash: 0xdef...)
  └─ Transaction 3 (Hash: 0x123...)
```

---


#### Hybrid Approach: Blockchain + Database

Alasan menggunakan database tradisional:
- Ada limit dalam penarikan data dari blockchain (rate limits, cost)
- Query kompleks lebih efisien di database
- Caching untuk performa lebih baik


```
Smart Contract → Emit Event → Backend Listener → Store to Database
```

Workflow:
1. Smart Contract emit event saat terjadi transaksi
2. Backend Service listen event tersebut (menggunakan WebSocket/Polling)
3. Validasi bahwa transaksi sudah sukses (confirmed)
4. Store data ke database dengan menyimpan block number sebagai reference


Keuntungan pattern ini:
- Blockchain sebagai single source of truth
- Database untuk fast querying & analytics
- Block number sebagai reference untuk verify kembali ke blockchain
- Tidak perlu query blockchain berulang kali (hemat cost & waktu)

---

### Best Practices

#### Development
- Always read whitepaper - Pahami arsitektur dan ekonomi token project
- Test di testnet dulu - Jangan langsung deploy ke mainnet
- Monitor gas prices - Optimize transaksi untuk cost efficiency
- Use event indexing - Untuk tracking state changes efficiently

#### Smart Contract
- Minimize state changes - Setiap write operation kena gas
- Use events for logging - Lebih murah daripada storage
- Batch operations - Combine multiple actions untuk hemat gas
- Consider Layer 2 - Untuk aplikasi yang butuh high throughput

#### Backend Integration
- Listen to events - Gunakan WebSocket untuk real-time updates
- Store block numbers - Untuk reference dan audit trail
- Handle reorgs - Blockchain bisa reorganize, siapkan fallback
- Implement retry logic - Network bisa unstable, perlu error handling

---

## Key Takeaways

### Session 1
- Blockchain menawarkan security, transparency, dan immutability
- Layer 2 solutions solve scalability issues
- Gas fee adalah cost untuk komputasi dan storage on-chain
- Always DYOR (Do Your Own Research) - baca whitepaper

### Session 2
- Block number adalah reference penting untuk tracking
- Hybrid architecture (blockchain + database) untuk production apps
- Event listening adalah pattern standard untuk backend integration
- Database menyimpan block number untuk verifikasi dan audit




Last Updated: October 26, 2025  
Workshop: BlockDevId - KelasRutin4  
Instructor: Ethereum Jakarta Team