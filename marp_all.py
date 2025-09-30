from os import system

# list all sources to marp
inputs = [f'w0{i}' for i in range(1, 10)]
inputs += ['c01', 'cw_powtorka']

# make pdfs as well?
make_pdfs = True

cmd = 'marp '
for i in inputs:
    cmd += f'{i}.md '

print(f'Running {cmd}')
system(cmd)

# make pdfs
if make_pdfs:
    for i in inputs:
        cmd = f'marp {i}.md -o pdf/{i}.pdf --allow-local-files'
        system(cmd)
