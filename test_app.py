import json
from app import app

def test_home_route():
    tester = app.test_client()
    response = tester.get("/")
    data = json.loads(response.data)

    assert response.status_code == 200
    assert "message" in data
    assert data["message"] == "Welcome to Jenkins Flask Demo!"


def test_health_route():
    tester = app.test_client()
    response = tester.get("/health")
    data = json.loads(response.data)

    assert response.status_code == 200
    assert data["status"] == "ok"
