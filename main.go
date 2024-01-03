package main

import (
	"encoding/json"
	"fmt"
	"os"
	"os/exec"
)

type TerraformState struct {
	Outputs map[string]Output `json:"outputs"`
}

type Output struct {
	Value interface{} `json:"value"`
}

func readState() (*TerraformState, error) {
	stateFilePath := "terraform.tfstate"

	data, err := os.ReadFile(stateFilePath)
	if err != nil {
		return nil, err
	}

	var state TerraformState
	err = json.Unmarshal(data, &state)
	if err != nil {
		return nil, err
	}

	return &state, nil
}

func main() {
	state, err := readState()
	if err != nil {
		fmt.Println("Error reading state file", err)
		return
	}

	accessKey, ok := state.Outputs["dynamodb_access_key"].Value.(string)
	if !ok {
		fmt.Println("Error retrieving access key")
		return
	}

	secretKey, ok := state.Outputs["dynamodb_secret_key"].Value.(string)
	if !ok {
		fmt.Println("Error retrieving secret key")
		return
	}

	cmd := exec.Command("doppler", "secrets", "set",
		fmt.Sprintf("DYNAMO_ACCESS_KEY=\"%s\"", accessKey),
		fmt.Sprintf("DYNAMO_SECRET_KEY=\"%s\"", secretKey),
	)

	cmd.Env = os.Environ()

	if err := cmd.Run(); err != nil {
		fmt.Println("Error pushing to Doppler", err)
		return
	}


	fmt.Println("Obtained secrets")
}