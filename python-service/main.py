from fastapi import FastAPI

app = FastAPI(title="Literasi Ceria API")


@app.get("/")
def halaman_utama():
    return {
        "aplikasi": "Literasi Ceria",
        "status": "berjalan",
        "pesan": "API Python berhasil dijalankan!"
    }
