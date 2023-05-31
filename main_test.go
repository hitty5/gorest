package main

import (
	"encoding/json"
	"github.com/stretchr/testify/assert"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestGetAlbums(t *testing.T) {
	router := setupRouter()

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/albums", nil)
	router.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)
	var response []interface{}
	json.Unmarshal(w.Body.Bytes(), &response)
	assert.Lenf(t, response, 3, "Album length incorrect")
}
