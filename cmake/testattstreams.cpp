#include <sys/types.h>
#include <stropts.h>
#include <sys/conf.h>

int main(int argc, char** argv){
	ioctl(1,I_NREAD);
	return 0;
}
