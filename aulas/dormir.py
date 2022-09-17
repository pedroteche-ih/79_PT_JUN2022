import time

def dormir_do_arquivo(x):
    '''
    Dormir x-segundos e retorna x.
    '''
    
    print(f'Dormindo por {x} segundos.')
    time.sleep(x)
    print(f'Retornando {x}')
    return x