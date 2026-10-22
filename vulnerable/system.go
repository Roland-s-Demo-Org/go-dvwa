package vulnerable

import (
	"context"
	"fmt"
	"os/exec"
	"regexp"
)

func System(ctx context.Context, cmd string) ([]byte, error) {
	validInput := regexp.MustCompile(`^[a-zA-Z0-9_\-\./\\ ]+$`)
	if !validInput.MatchString(cmd) {
		return nil, fmt.Errorf("invalid input")
	}
	return exec.CommandContext(ctx, "sh", "-c", cmd).CombinedOutput()
}
