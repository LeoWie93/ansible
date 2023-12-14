- name: Install nvm
  become: true
  become_user: "{{ user }}"
  shell: curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  tags:
    - install
    - node

- name: source nvm
  become: true
  become_user: "{{ user }}"
  shell: source ~/.zshrc
  tags:
    - install
    - node


- name: install node 20
  become: true
  become_user: "{{ user }}"
  shell: nvm install 20
  tags:
    - install
    - node

